function [aeroForces] = paramSpace_12_1_4_2_1_2_2(sailStates,airStates)

	CL = (4.221518)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.760973)*sailStates.p + (38.354645)*sailStates.q + (1.425887)*sailStates.r + (0.011160)*sailStates.de;
	CD = -0.156030;
	CY = (-0.021668)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.517305)*sailStates.p + (-0.520428)*sailStates.q + (-0.072758)*sailStates.r + (-0.000112)*sailStates.de;

	Cl = (1.459759)*sailStates.alpha + (-0.237781)*sailStates.beta + (-1.364954)*sailStates.p + (11.853978)*sailStates.q + (1.159566)*sailStates.r + (0.000599)*sailStates.de;
	Cm = (-13.574714)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.832157)*sailStates.p + (-141.704483)*sailStates.q + (-4.817722)*sailStates.r + (-0.069692)*sailStates.de;
	Cn = (-0.110551)*sailStates.alpha + (0.033418)*sailStates.beta + (-0.969231)*sailStates.p + (4.023958)*sailStates.q + (-0.000006)*sailStates.r + (0.000215)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end