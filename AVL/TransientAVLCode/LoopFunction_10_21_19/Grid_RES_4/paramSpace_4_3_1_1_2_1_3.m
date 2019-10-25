function [aeroForces] = paramSpace_4_3_1_1_2_1_3(sailStates,airStates)

	CL = (5.476203)*sailStates.alpha + (0.100497)*sailStates.beta + (-3.163776)*sailStates.p + (34.540577)*sailStates.q + (-0.937305)*sailStates.r + (0.009630)*sailStates.de;
	CD = -1.961660;
	CY = (-0.347393)*sailStates.alpha + (-0.024341)*sailStates.beta + (-0.727138)*sailStates.p + (-0.662189)*sailStates.q + (0.144708)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.745239)*sailStates.alpha + (0.407509)*sailStates.beta + (-1.793751)*sailStates.p + (14.347840)*sailStates.q + (-1.170038)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-15.363383)*sailStates.alpha + (-0.434803)*sailStates.beta + (12.413308)*sailStates.p + (-158.727356)*sailStates.q + (3.034958)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (0.622068)*sailStates.alpha + (-0.072775)*sailStates.beta + (1.989290)*sailStates.p + (-9.651127)*sailStates.q + (-0.092500)*sailStates.r + (0.000028)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end