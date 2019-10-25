function [aeroForces] = paramSpace_2_2_3_2_3_3_3(sailStates,airStates)

	CL = (4.267529)*sailStates.alpha + (0.047244)*sailStates.beta + (-2.934927)*sailStates.p + (37.054119)*sailStates.q + (0.426507)*sailStates.r + (0.011011)*sailStates.de;
	CD = -0.318010;
	CY = (0.151601)*sailStates.alpha + (-0.025256)*sailStates.beta + (0.268056)*sailStates.p + (0.870357)*sailStates.q + (0.017600)*sailStates.r + (0.000189)*sailStates.de;

	Cl = (1.387161)*sailStates.alpha + (-0.160153)*sailStates.beta + (-1.539839)*sailStates.p + (12.731627)*sailStates.q + (0.519287)*sailStates.r + (0.000905)*sailStates.de;
	Cm = (-14.669885)*sailStates.alpha + (-0.207184)*sailStates.beta + (10.236959)*sailStates.p + (-147.878265)*sailStates.q + (-1.469709)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (-0.118836)*sailStates.alpha + (-0.011403)*sailStates.beta + (-0.713744)*sailStates.p + (2.896833)*sailStates.q + (-0.006223)*sailStates.r + (-0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end