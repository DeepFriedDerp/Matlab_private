function [aeroForces] = paramSpace_4_3_3_1_2_1_3(sailStates,airStates)

	CL = (5.348108)*sailStates.alpha + (0.086756)*sailStates.beta + (-3.161929)*sailStates.p + (34.639282)*sailStates.q + (-0.917963)*sailStates.r + (0.009448)*sailStates.de;
	CD = -1.887810;
	CY = (-0.336231)*sailStates.alpha + (-0.024249)*sailStates.beta + (-0.697770)*sailStates.p + (-0.662190)*sailStates.q + (0.138771)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.738010)*sailStates.alpha + (0.391691)*sailStates.beta + (-1.792870)*sailStates.p + (14.352213)*sailStates.q + (-1.121462)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-14.960701)*sailStates.alpha + (-0.344583)*sailStates.beta + (12.390496)*sailStates.p + (-158.727356)*sailStates.q + (2.920277)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (0.587767)*sailStates.alpha + (-0.069713)*sailStates.beta + (1.945071)*sailStates.p + (-9.629149)*sailStates.q + (-0.092849)*sailStates.r + (-0.000003)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end