function [aeroForces] = paramSpace_4_4_2_1_3_2_3(sailStates,airStates)

	CL = (3.345227)*sailStates.alpha + (-0.181617)*sailStates.beta + (-3.363098)*sailStates.p + (41.979504)*sailStates.q + (0.890750)*sailStates.r + (0.010981)*sailStates.de;
	CD = 0.084820;
	CY = (0.143455)*sailStates.alpha + (-0.027872)*sailStates.beta + (0.053408)*sailStates.p + (1.002333)*sailStates.q + (-0.010659)*sailStates.r + (0.000214)*sailStates.de;

	Cl = (1.135838)*sailStates.alpha + (-0.131074)*sailStates.beta + (-1.837373)*sailStates.p + (15.886701)*sailStates.q + (0.581701)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-12.290948)*sailStates.alpha + (0.631236)*sailStates.beta + (11.437200)*sailStates.p + (-160.076111)*sailStates.q + (-3.023845)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-0.427222)*sailStates.alpha + (0.024224)*sailStates.beta + (0.173120)*sailStates.p + (-2.825446)*sailStates.q + (-0.077428)*sailStates.r + (-0.000275)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end