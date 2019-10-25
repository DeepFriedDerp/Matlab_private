function [aeroForces] = paramSpace_1_1_2_1_1_2_2(sailStates,airStates)

	CL = (3.846562)*sailStates.alpha + (-0.109226)*sailStates.beta + (-2.529867)*sailStates.p + (34.759029)*sailStates.q + (-0.444747)*sailStates.r + (0.010614)*sailStates.de;
	CD = 0.041900;
	CY = (-0.202070)*sailStates.alpha + (-0.020620)*sailStates.beta + (0.069703)*sailStates.p + (-1.671347)*sailStates.q + (0.012291)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (1.242173)*sailStates.alpha + (0.004939)*sailStates.beta + (-1.236488)*sailStates.p + (10.274146)*sailStates.q + (-0.255383)*sailStates.r + (0.000545)*sailStates.de;
	Cm = (-14.018734)*sailStates.alpha + (0.408912)*sailStates.beta + (8.769554)*sailStates.p + (-136.726761)*sailStates.q + (1.545071)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.392354)*sailStates.alpha + (-0.002662)*sailStates.beta + (-0.294549)*sailStates.p + (3.279423)*sailStates.q + (-0.058524)*sailStates.r + (0.000492)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end