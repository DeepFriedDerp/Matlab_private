function [aeroForces] = paramSpace_4_1_2_1_3_3_3(sailStates,airStates)

	CL = (5.018044)*sailStates.alpha + (0.703988)*sailStates.beta + (-3.533107)*sailStates.p + (49.911621)*sailStates.q + (3.142707)*sailStates.r + (0.012564)*sailStates.de;
	CD = -1.861970;
	CY = (0.558515)*sailStates.alpha + (-0.021700)*sailStates.beta + (1.085429)*sailStates.p + (1.002330)*sailStates.q + (-0.215941)*sailStates.r + (0.000214)*sailStates.de;

	Cl = (1.163727)*sailStates.alpha + (-0.362020)*sailStates.beta + (-1.985535)*sailStates.p + (19.168816)*sailStates.q + (2.688957)*sailStates.r + (0.001709)*sailStates.de;
	Cm = (-8.457044)*sailStates.alpha + (-2.629101)*sailStates.beta + (9.964654)*sailStates.p + (-160.076126)*sailStates.q + (-10.426835)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-1.904616)*sailStates.alpha + (0.113056)*sailStates.beta + (-2.156259)*sailStates.p + (7.466728)*sailStates.q + (-0.027350)*sailStates.r + (-0.000041)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end