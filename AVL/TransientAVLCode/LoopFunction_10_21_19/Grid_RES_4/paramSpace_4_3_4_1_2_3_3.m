function [aeroForces] = paramSpace_4_3_4_1_2_3_3(sailStates,airStates)

	CL = (6.160096)*sailStates.alpha + (-0.270035)*sailStates.beta + (-3.500885)*sailStates.p + (50.552856)*sailStates.q + (3.596330)*sailStates.r + (0.012542)*sailStates.de;
	CD = -2.451560;
	CY = (0.424376)*sailStates.alpha + (-0.024203)*sailStates.beta + (1.380957)*sailStates.p + (-0.662185)*sailStates.q + (-0.274760)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (2.055448)*sailStates.alpha + (-0.745386)*sailStates.beta + (-1.899999)*sailStates.p + (18.542875)*sailStates.q + (3.079752)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-9.753272)*sailStates.alpha + (1.035824)*sailStates.beta + (9.433998)*sailStates.p + (-158.727356)*sailStates.q + (-11.943042)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-1.885999)*sailStates.alpha + (0.130020)*sailStates.beta + (-2.773466)*sailStates.p + (11.438735)*sailStates.q + (0.013975)*sailStates.r + (0.000445)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end