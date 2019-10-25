function [aeroForces] = paramSpace_4_3_1_1_2_3_3(sailStates,airStates)

	CL = (6.199401)*sailStates.alpha + (-0.248154)*sailStates.beta + (-3.503886)*sailStates.p + (50.404789)*sailStates.q + (3.566150)*sailStates.r + (0.012815)*sailStates.de;
	CD = -2.403800;
	CY = (0.407633)*sailStates.alpha + (-0.024341)*sailStates.beta + (1.336905)*sailStates.p + (-0.662187)*sailStates.q + (-0.265856)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (2.059448)*sailStates.alpha + (-0.721597)*sailStates.beta + (-1.901291)*sailStates.p + (18.536320)*sailStates.q + (3.007033)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-10.357294)*sailStates.alpha + (0.900495)*sailStates.beta + (9.468214)*sailStates.p + (-158.727356)*sailStates.q + (-11.771028)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-1.831670)*sailStates.alpha + (0.125735)*sailStates.beta + (-2.706993)*sailStates.p + (11.405777)*sailStates.q + (0.015232)*sailStates.r + (0.000491)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end