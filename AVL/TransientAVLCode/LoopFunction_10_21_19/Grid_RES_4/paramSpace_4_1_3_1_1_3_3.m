function [aeroForces] = paramSpace_4_1_3_1_1_3_3(sailStates,airStates)

	CL = (7.503968)*sailStates.alpha + (0.844187)*sailStates.beta + (-3.433879)*sailStates.p + (50.508926)*sailStates.q + (4.004922)*sailStates.r + (0.012442)*sailStates.de;
	CD = -3.120820;
	CY = (0.254216)*sailStates.alpha + (-0.032432)*sailStates.beta + (1.629011)*sailStates.p + (-2.326710)*sailStates.q + (-0.324114)*sailStates.r + (-0.000496)*sailStates.de;

	Cl = (3.247239)*sailStates.alpha + (-0.442858)*sailStates.beta + (-1.923955)*sailStates.p + (19.344452)*sailStates.q + (3.412619)*sailStates.r + (0.001479)*sailStates.de;
	Cm = (-11.800633)*sailStates.alpha + (-3.153610)*sailStates.beta + (8.813343)*sailStates.p + (-155.326050)*sailStates.q + (-13.235947)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (-2.047392)*sailStates.alpha + (0.155379)*sailStates.beta + (-3.294292)*sailStates.p + (15.052198)*sailStates.q + (0.052650)*sailStates.r + (0.000970)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end