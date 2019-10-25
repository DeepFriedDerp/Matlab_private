function [aeroForces] = paramSpace_3_3_4_3_1_1_2(sailStates,airStates)

	CL = (4.121833)*sailStates.alpha + (0.010776)*sailStates.beta + (-2.544259)*sailStates.p + (34.240501)*sailStates.q + (-0.175838)*sailStates.r + (0.010837)*sailStates.de;
	CD = -0.082350;
	CY = (-0.061531)*sailStates.alpha + (-0.024746)*sailStates.beta + (-0.129730)*sailStates.p + (-0.498142)*sailStates.q + (0.008450)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.224961)*sailStates.alpha + (0.088864)*sailStates.beta + (-1.183028)*sailStates.p + (9.388337)*sailStates.q + (-0.240681)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.795664)*sailStates.alpha + (-0.025637)*sailStates.beta + (8.839439)*sailStates.p + (-136.960373)*sailStates.q + (0.571222)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (-0.082438)*sailStates.alpha + (-0.005382)*sailStates.beta + (0.390905)*sailStates.p + (-1.764135)*sailStates.q + (-0.004932)*sailStates.r + (0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end