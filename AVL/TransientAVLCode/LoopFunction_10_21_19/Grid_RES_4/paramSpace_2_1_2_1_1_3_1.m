function [aeroForces] = paramSpace_2_1_2_1_1_3_1(sailStates,airStates)

	CL = (6.918158)*sailStates.alpha + (0.515845)*sailStates.beta + (-1.621413)*sailStates.p + (24.790449)*sailStates.q + (2.445916)*sailStates.r + (0.009945)*sailStates.de;
	CD = -2.822420;
	CY = (-0.688655)*sailStates.alpha + (-0.022540)*sailStates.beta + (1.277315)*sailStates.p + (-1.915489)*sailStates.q + (0.083787)*sailStates.r + (-0.000404)*sailStates.de;

	Cl = (2.135657)*sailStates.alpha + (-0.393499)*sailStates.beta + (-0.517204)*sailStates.p + (2.878708)*sailStates.q + (2.293519)*sailStates.r + (-0.000636)*sailStates.de;
	Cm = (-16.456627)*sailStates.alpha + (-1.978182)*sailStates.beta + (6.423278)*sailStates.p + (-112.650780)*sailStates.q + (-8.254755)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (2.560544)*sailStates.alpha + (-0.042955)*sailStates.beta + (-2.837517)*sailStates.p + (14.376789)*sailStates.q + (-0.033529)*sailStates.r + (0.000744)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end