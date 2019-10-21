function [aeroForces] = paramSpace_1_1_1_1_2_1_1(sailStates,airStates)

	CL = (2.846336)*sailStates.alpha + (-0.029618)*sailStates.beta + (-4.107257)*sailStates.p + (46.286354)*sailStates.q + (-0.512254)*sailStates.r + (0.010918)*sailStates.de;
	CD = -0.170320;
	CY = (0.176477)*sailStates.alpha + (-0.026550)*sailStates.beta + (0.050067)*sailStates.p + (1.149167)*sailStates.q + (0.008719)*sailStates.r + (0.000252)*sailStates.de;

	Cl = (1.029160)*sailStates.alpha + (-0.094768)*sailStates.beta + (-2.546781)*sailStates.p + (22.448765)*sailStates.q + (-0.219839)*sailStates.r + (0.002679)*sailStates.de;
	Cm = (-10.301745)*sailStates.alpha + (0.110500)*sailStates.beta + (14.315481)*sailStates.p + (-182.050079)*sailStates.q + (1.795828)*sailStates.r + (-0.073616)*sailStates.de;
	Cn = (-0.207177)*sailStates.alpha + (-0.016409)*sailStates.beta + (-0.585499)*sailStates.p + (3.727290)*sailStates.q + (-0.062851)*sailStates.r + (-0.000252)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end