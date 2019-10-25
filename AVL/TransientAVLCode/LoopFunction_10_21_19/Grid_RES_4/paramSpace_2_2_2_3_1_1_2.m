function [aeroForces] = paramSpace_2_2_2_3_1_1_2(sailStates,airStates)

	CL = (4.202685)*sailStates.alpha + (-0.071714)*sailStates.beta + (-2.588575)*sailStates.p + (35.730667)*sailStates.q + (-0.860309)*sailStates.r + (0.011184)*sailStates.de;
	CD = -0.141290;
	CY = (-0.063133)*sailStates.alpha + (-0.024781)*sailStates.beta + (-0.310894)*sailStates.p + (-0.498142)*sailStates.q + (-0.020360)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.271781)*sailStates.alpha + (0.156627)*sailStates.beta + (-1.232807)*sailStates.p + (10.186385)*sailStates.q + (-0.745973)*sailStates.r + (0.000399)*sailStates.de;
	Cm = (-14.260201)*sailStates.alpha + (0.286292)*sailStates.beta + (8.667191)*sailStates.p + (-137.428818)*sailStates.q + (2.933074)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (0.020522)*sailStates.alpha + (0.011449)*sailStates.beta + (0.638725)*sailStates.p + (-2.251758)*sailStates.q + (-0.001798)*sailStates.r + (0.000094)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end