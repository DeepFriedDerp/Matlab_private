function [aeroForces] = paramSpace_3_2_2_2_3_3_3(sailStates,airStates)

	CL = (4.312022)*sailStates.alpha + (0.091351)*sailStates.beta + (-3.003080)*sailStates.p + (39.384460)*sailStates.q + (1.189752)*sailStates.r + (0.011504)*sailStates.de;
	CD = -0.361000;
	CY = (0.158353)*sailStates.alpha + (-0.024761)*sailStates.beta + (0.436834)*sailStates.p + (0.668511)*sailStates.q + (-0.028655)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.379177)*sailStates.alpha + (-0.218855)*sailStates.beta + (-1.566137)*sailStates.p + (13.342439)*sailStates.q + (1.040703)*sailStates.r + (0.000940)*sailStates.de;
	Cm = (-13.764047)*sailStates.alpha + (-0.346236)*sailStates.beta + (9.965238)*sailStates.p + (-148.601746)*sailStates.q + (-4.029397)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (-0.324481)*sailStates.alpha + (0.016108)*sailStates.beta + (-0.916769)*sailStates.p + (3.377127)*sailStates.q + (-0.001378)*sailStates.r + (-0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end