function [aeroForces] = paramSpace_1_4_3_3_1_1_1(sailStates,airStates)

	CL = (4.008800)*sailStates.alpha + (0.316105)*sailStates.beta + (-2.275288)*sailStates.p + (35.101292)*sailStates.q + (-1.409926)*sailStates.r + (0.010856)*sailStates.de;
	CD = -0.131180;
	CY = (-0.043831)*sailStates.alpha + (-0.026893)*sailStates.beta + (-0.407142)*sailStates.p + (-0.684401)*sailStates.q + (-0.081010)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (0.980741)*sailStates.alpha + (0.315455)*sailStates.beta + (-0.926211)*sailStates.p + (7.844133)*sailStates.q + (-1.079110)*sailStates.r + (-0.000095)*sailStates.de;
	Cm = (-12.540347)*sailStates.alpha + (-1.152358)*sailStates.beta + (7.039622)*sailStates.p + (-127.495163)*sailStates.q + (4.699509)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (-0.143541)*sailStates.alpha + (0.046973)*sailStates.beta + (0.806460)*sailStates.p + (-2.714882)*sailStates.q + (-0.017575)*sailStates.r + (0.000126)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end