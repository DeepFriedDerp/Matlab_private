function [aeroForces] = paramSpace_4_3_2_1_2_3_3(sailStates,airStates)

	CL = (6.192640)*sailStates.alpha + (-0.255565)*sailStates.beta + (-3.502858)*sailStates.p + (50.454144)*sailStates.q + (3.576353)*sailStates.r + (0.012724)*sailStates.de;
	CD = -2.426580;
	CY = (0.413215)*sailStates.alpha + (-0.024295)*sailStates.beta + (1.351589)*sailStates.p + (-0.662188)*sailStates.q + (-0.268824)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (2.058332)*sailStates.alpha + (-0.729530)*sailStates.beta + (-1.900850)*sailStates.p + (18.538504)*sailStates.q + (3.031321)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-10.155953)*sailStates.alpha + (0.945605)*sailStates.beta + (9.456808)*sailStates.p + (-158.727356)*sailStates.q + (-11.828367)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-1.849880)*sailStates.alpha + (0.127148)*sailStates.beta + (-2.729103)*sailStates.p + (11.416765)*sailStates.q + (0.015055)*sailStates.r + (0.000476)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end