function [aeroForces] = paramSpace_1_1_3_3_2_2_3(sailStates,airStates)

	CL = (3.796987)*sailStates.alpha + (-0.207759)*sailStates.beta + (-2.712346)*sailStates.p + (37.126225)*sailStates.q + (-1.075341)*sailStates.r + (0.010643)*sailStates.de;
	CD = 0.067480;
	CY = (-0.002524)*sailStates.alpha + (-0.025386)*sailStates.beta + (-0.243739)*sailStates.p + (0.194782)*sailStates.q + (-0.048476)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.336337)*sailStates.alpha + (0.039037)*sailStates.beta + (-1.407386)*sailStates.p + (12.405954)*sailStates.q + (-0.752357)*sailStates.r + (0.000786)*sailStates.de;
	Cm = (-13.458188)*sailStates.alpha + (0.715647)*sailStates.beta + (8.923935)*sailStates.p + (-140.845245)*sailStates.q + (3.598670)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.242340)*sailStates.alpha + (0.018705)*sailStates.beta + (0.309513)*sailStates.p + (-0.603040)*sailStates.q + (-0.032448)*sailStates.r + (-0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end