function [aeroForces] = paramSpace_4_4_2_1_3_3_3(sailStates,airStates)

	CL = (5.018045)*sailStates.alpha + (-0.703988)*sailStates.beta + (-3.533106)*sailStates.p + (49.911610)*sailStates.q + (3.142707)*sailStates.r + (0.012564)*sailStates.de;
	CD = -1.861970;
	CY = (0.558515)*sailStates.alpha + (-0.027872)*sailStates.beta + (1.085429)*sailStates.p + (1.002330)*sailStates.q + (-0.215941)*sailStates.r + (0.000214)*sailStates.de;

	Cl = (1.087382)*sailStates.alpha + (-0.789431)*sailStates.beta + (-1.891146)*sailStates.p + (17.980940)*sailStates.q + (2.670224)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-8.457046)*sailStates.alpha + (2.629101)*sailStates.beta + (9.964653)*sailStates.p + (-160.076111)*sailStates.q + (-10.426835)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-1.731340)*sailStates.alpha + (0.115982)*sailStates.beta + (-2.175034)*sailStates.p + (7.703010)*sailStates.q + (-0.023623)*sailStates.r + (-0.000041)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end