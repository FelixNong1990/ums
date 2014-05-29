<?php include_once('classes/address_listings.class.php');?>
<?php include_once('header.php');?>

<div class="tabs-left">

	<form class="add_address_listings form-horizontal" method="post" action="address_listings.php">
	<div class="row">
	<div class="tab-content">

		<?php if ( !$profile->guest ) : ?>
		
		<div class="tab-pane fade in active" id="usr-control">
		
			<fieldset>
				<legend><?php _e('General'); ?></legend>
				<div class="span6">
				<div class="control-group">
					<label class="control-label" for="case_number"><?php _e('Case Number'); ?></label>
					<div class="controls">
						<input type="text" autocomplete="on" class="input-xlarge" id="case_number" name="case_number">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="respondent_name"><?php _e('Respondent Name'); ?></label>
					<div class="controls">
						<input type="text" autocomplete="on" class="input-xlarge" id="respondent_name" name="respondent_name" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="CurrentPass"><?php _e('Block'); ?></label>
					<div class="controls">
						<input type="text" autocomplete="on" class="input-xlarge" id="block" name="block" >
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="road"><?php _e('Road Name'); ?></label>
					<div class="controls">
						<input type="text" class="input-xlarge" id="road" name="road" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="unit"><?php _e('Unit Number'); ?></label>
					<div class="controls">
						<input type="text" class="input-xlarge" id="unit" name="unit" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="postal_code"><?php _e('Postal Code'); ?></label>
					<div class="controls">
						<input type="text" class="input-xlarge" id="postal_code" name="postal_code" />
					</div>
				</div>
				</div>
				<div class="span6">
				<div class="control-group">
					<label class="control-label" for="age"><?php _e('Age'); ?></label>
					<div class="controls">
						<input type="text" class="input-xlarge" id="age" name="age" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gender"><?php _e('Gender'); ?></label>
					<div class="controls">
						<select class="simple_select" name="gender" id="gender">
							<option value="0">Male</option>
							<option value="1">Female</option>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="nationality"><?php _e('Nationality'); ?></label>
					<div class="controls">
						<input type="text" autocomplete="on" class="input-xlarge" id="nationality" name="nationality" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="visit_count"><?php _e('Number of visit'); ?></label>
					<div class="controls">
						<input type="text" autocomplete="on" class="input-xlarge" id="visit_count" name="visit_count" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="visit_status"><?php _e('Visit Status'); ?></label>
					<div class="controls">
						<input type="text" autocomplete="on" class="input-xlarge" id="visit_status" name="visit_status" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="remarks"><?php _e('Remarks'); ?></label>
					<div class="controls">
						<input type="text" autocomplete="on" class="input-xlarge" id="remarks" name="remarks" />
					</div>
				</div>
				</div>
				<?php if ( $profile->getOption('profile-public-enable') ) : ?>
				<div class="control-group">
					<label class="control-label" for="confirm"><?php _e('Your public link'); ?></label>
					<div class="controls">
						<span class="uneditable-input"><?php echo SITE_PATH . 'profile.php?uid=' . $profile->getField('user_id'); ?></span>
					</div>
				</div>
				<?php endif; ?>
			</fieldset>
			
		</div>
		<?php endif; ?>
		</div>
		<?php $profile->generateProfilePanels($profile->guest); ?>

		<?php if (!$profile->guest && !$profile->denyAccessLogs()) : ?>
		<div class="tab-pane fade" id="usr-access-logs">
			<fieldset>
				<legend><?php _e('Access Logs'); ?></legend>
				<?php $profile->generateAccessLogs(); ?>
			</fieldset>
		</div>
		<?php endif; ?>
		
		<?php if ( !$profile->guest && !empty( $jigowatt_integration->enabledMethods ) ) : ?>
		<div class="tab-pane fade" id="usr-integration">
			<fieldset>
				<legend><?php _e('Integration'); ?></legend><br>

				<p><?php _e('Use your preferred social method to login the next time you visit our site.'); ?></p><br>

				<?php

					foreach ($jigowatt_integration->enabledMethods as $key ) :
						$inUse = $jigowatt_integration->isUsed($key);
						?><div class="span3">
							<a class="a-tooltip" href="#" data-rel="tooltip" tabindex="99" title="<?php echo ucwords($key); ?>">
								<img src="assets/img/<?php echo $key; ?>.png" alt="<?php echo $key; ?>">
							</a>
							<a href="<?php echo $inUse ? '#' : '?link='.$key; ?>" class="btn btn-small btn-info<?php echo $inUse ? ' disabled' : ''; ?>"><?php _e('Link'); ?></a>
							<a href="<?php echo !$inUse ? '#' : '?unlink='.$key; ?>" class="btn btn-small<?php echo !$inUse ? ' disabled' : ''; ?>"><?php _e('Unlink'); ?></a>
							</div><?php

					endforeach;

				?>

			</fieldset>
		</div>
		<?php endif; ?>

		<?php if ( !$profile->guest ) : ?>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary"><?php _e('Add'); ?></button>
		</div>
		<?php endif; ?>

	</div>
	</form>
</div>

<?php include ('footer.php'); ?>