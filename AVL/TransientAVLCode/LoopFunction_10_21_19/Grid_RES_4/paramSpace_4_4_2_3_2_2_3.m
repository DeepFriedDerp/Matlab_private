function [aeroForces] = paramSpace_4_4_2_3_2_2_3(sailStates,airStates)

	CL = (3.796987)*sailStates.alpha + (-0.207759)*sailStates.beta + (-2.712345)*sailStates.p + (37.126225)*sailStates.q + (1.075341)*sailStates.r + (0.010643)*sailStates.de;
	CD = 0.067480;
	CY = (0.002524)*sailStates.alpha + (-0.024186)*sailStates.beta + (0.243739)*sailStates.p + (-0.194782)*sailStates.q + (-0.048476)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.207873)*sailStates.alpha + (-0.183615)*sailStates.beta + (-1.312996)*sailStates.p + (11.218073)*sailStates.q + (0.733624)*sailStates.r + (0.000530)*sailStates.de;
	Cm = (-13.458187)*sailStates.alpha + (0.715647)*sailStates.beta + (8.923935)*sailStates.p + (-140.845245)*sailStates.q + (-3.598670)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (-0.185814)*sailStates.alpha + (0.025583)*sailStates.beta + (-0.328288)*sailStates.p + (0.839325)*sailStates.q + (-0.028722)*sailStates.r + (0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end