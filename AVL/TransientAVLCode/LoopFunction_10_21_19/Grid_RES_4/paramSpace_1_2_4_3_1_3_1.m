function [aeroForces] = paramSpace_1_2_4_3_1_3_1(sailStates,airStates)

	CL = (4.050206)*sailStates.alpha + (0.003313)*sailStates.beta + (-2.194975)*sailStates.p + (30.662663)*sailStates.q + (-0.086639)*sailStates.r + (0.010188)*sailStates.de;
	CD = -0.142520;
	CY = (-0.104658)*sailStates.alpha + (-0.024320)*sailStates.beta + (0.211746)*sailStates.p + (-0.684401)*sailStates.q + (0.042045)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.148623)*sailStates.alpha + (-0.079616)*sailStates.beta + (-0.966789)*sailStates.p + (7.479756)*sailStates.q + (0.153266)*sailStates.r + (0.000078)*sailStates.de;
	Cm = (-15.060842)*sailStates.alpha + (-0.049421)*sailStates.beta + (7.975956)*sailStates.p + (-128.521423)*sailStates.q + (0.330110)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (0.407937)*sailStates.alpha + (-0.018179)*sailStates.beta + (-0.604542)*sailStates.p + (3.632219)*sailStates.q + (-0.051722)*sailStates.r + (0.000228)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end