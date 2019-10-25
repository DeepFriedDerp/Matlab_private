function [aeroForces] = paramSpace_1_2_1_2_1_2_2(sailStates,airStates)

	CL = (3.824368)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.521893)*sailStates.p + (35.189041)*sailStates.q + (-0.696672)*sailStates.r + (0.010648)*sailStates.de;
	CD = 0.086700;
	CY = (-0.094588)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.096639)*sailStates.p + (-0.759371)*sailStates.q + (-0.016968)*sailStates.r + (-0.000162)*sailStates.de;

	Cl = (1.172067)*sailStates.alpha + (0.078604)*sailStates.beta + (-1.186729)*sailStates.p + (9.855523)*sailStates.q + (-0.475830)*sailStates.r + (0.000381)*sailStates.de;
	Cm = (-13.756813)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.536138)*sailStates.p + (-136.489655)*sailStates.q + (2.395060)*sailStates.r + (-0.068470)*sailStates.de;
	Cn = (0.234009)*sailStates.alpha + (0.013860)*sailStates.beta + (0.049074)*sailStates.p + (1.098231)*sailStates.q + (-0.038674)*sailStates.r + (0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end