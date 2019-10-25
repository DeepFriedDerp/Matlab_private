function [aeroForces] = paramSpace_2_3_3_2_1_1_3(sailStates,airStates)

	CL = (4.312022)*sailStates.alpha + (0.091351)*sailStates.beta + (-3.003080)*sailStates.p + (39.384464)*sailStates.q + (-1.189752)*sailStates.r + (0.011504)*sailStates.de;
	CD = -0.361000;
	CY = (-0.158353)*sailStates.alpha + (-0.025191)*sailStates.beta + (-0.436834)*sailStates.p + (-0.668511)*sailStates.q + (-0.028655)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.335846)*sailStates.alpha + (0.271424)*sailStates.beta + (-1.533488)*sailStates.p + (12.938559)*sailStates.q + (-1.038577)*sailStates.r + (0.000852)*sailStates.de;
	Cm = (-13.764049)*sailStates.alpha + (-0.346236)*sailStates.beta + (9.965238)*sailStates.p + (-148.601761)*sailStates.q + (4.029397)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (0.300137)*sailStates.alpha + (0.016027)*sailStates.beta + (0.918909)*sailStates.p + (-3.403599)*sailStates.q + (-0.001239)*sailStates.r + (0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end