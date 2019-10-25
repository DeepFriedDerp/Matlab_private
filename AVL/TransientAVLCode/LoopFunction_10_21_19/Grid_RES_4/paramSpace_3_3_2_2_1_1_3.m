function [aeroForces] = paramSpace_3_3_2_2_1_1_3(sailStates,airStates)

	CL = (4.267529)*sailStates.alpha + (0.047244)*sailStates.beta + (-2.934927)*sailStates.p + (37.054119)*sailStates.q + (-0.426507)*sailStates.r + (0.011011)*sailStates.de;
	CD = -0.318010;
	CY = (-0.151601)*sailStates.alpha + (-0.024697)*sailStates.beta + (-0.268056)*sailStates.p + (-0.870357)*sailStates.q + (0.017600)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.341105)*sailStates.alpha + (0.178070)*sailStates.beta + (-1.507189)*sailStates.p + (12.327744)*sailStates.q + (-0.521413)*sailStates.r + (0.000817)*sailStates.de;
	Cm = (-14.669887)*sailStates.alpha + (-0.207184)*sailStates.beta + (10.236959)*sailStates.p + (-147.878265)*sailStates.q + (1.469709)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (0.107030)*sailStates.alpha + (-0.010765)*sailStates.beta + (0.711604)*sailStates.p + (-2.870361)*sailStates.q + (-0.006083)*sailStates.r + (0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end