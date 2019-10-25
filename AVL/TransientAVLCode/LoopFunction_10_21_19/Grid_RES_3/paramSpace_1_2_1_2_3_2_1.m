function [aeroForces] = paramSpace_1_2_1_2_3_2_1(sailStates,airStates)

	CL = (3.906637)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.091113)*sailStates.p + (32.118896)*sailStates.q + (-0.947290)*sailStates.r + (0.010459)*sailStates.de;
	CD = 0.045130;
	CY = (0.113869)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.296027)*sailStates.p + (0.491415)*sailStates.q + (-0.052244)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.068464)*sailStates.alpha + (0.128415)*sailStates.beta + (-0.841361)*sailStates.p + (6.866452)*sailStates.q + (-0.681813)*sailStates.r + (-0.000222)*sailStates.de;
	Cm = (-13.536017)*sailStates.alpha + (0.000000)*sailStates.beta + (6.801708)*sailStates.p + (-123.667763)*sailStates.q + (3.197626)*sailStates.r + (-0.067234)*sailStates.de;
	Cn = (-0.219082)*sailStates.alpha + (0.022643)*sailStates.beta + (0.524443)*sailStates.p + (-2.276172)*sailStates.q + (-0.001729)*sailStates.r + (-0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end