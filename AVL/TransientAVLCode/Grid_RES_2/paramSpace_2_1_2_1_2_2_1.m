function [aeroForces] = paramSpace_2_1_2_1_2_2_1(sailStates,airStates)

	CL = (6.145061)*sailStates.alpha + (-2.055768)*sailStates.beta + (-3.748134)*sailStates.p + (51.451225)*sailStates.q + (2.309441)*sailStates.r + (0.012853)*sailStates.de;
	CD = -6.382190;
	CY = (2.046265)*sailStates.alpha + (-0.138474)*sailStates.beta + (0.317754)*sailStates.p + (16.021851)*sailStates.q + (-0.033890)*sailStates.r + (0.003396)*sailStates.de;

	Cl = (-5.548241)*sailStates.alpha + (-1.087345)*sailStates.beta + (-1.910317)*sailStates.p + (16.580929)*sailStates.q + (2.544847)*sailStates.r + (0.001689)*sailStates.de;
	Cm = (4.273607)*sailStates.alpha + (9.204689)*sailStates.beta + (11.711080)*sailStates.p + (-166.212158)*sailStates.q + (-8.159497)*sailStates.r + (-0.068443)*sailStates.de;
	Cn = (-2.332951)*sailStates.alpha + (0.232709)*sailStates.beta + (-0.915798)*sailStates.p + (-9.205248)*sailStates.q + (-0.200536)*sailStates.r + (-0.004433)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end