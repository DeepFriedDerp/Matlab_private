function [aeroForces] = paramSpace_1_3_2_1_1_2_2(sailStates,airStates)

	CL = (3.846562)*sailStates.alpha + (0.109226)*sailStates.beta + (-2.529867)*sailStates.p + (34.759029)*sailStates.q + (-0.444747)*sailStates.r + (0.010614)*sailStates.de;
	CD = 0.041900;
	CY = (-0.202070)*sailStates.alpha + (-0.029042)*sailStates.beta + (0.069703)*sailStates.p + (-1.671347)*sailStates.q + (0.012291)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (1.116517)*sailStates.alpha + (0.055594)*sailStates.beta + (-1.151852)*sailStates.p + (9.213281)*sailStates.q + (-0.240460)*sailStates.r + (0.000317)*sailStates.de;
	Cm = (-14.018734)*sailStates.alpha + (-0.408912)*sailStates.beta + (8.769554)*sailStates.p + (-136.726761)*sailStates.q + (1.545071)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.362580)*sailStates.alpha + (0.013336)*sailStates.beta + (-0.279625)*sailStates.p + (3.092364)*sailStates.q + (-0.055893)*sailStates.r + (0.000492)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end