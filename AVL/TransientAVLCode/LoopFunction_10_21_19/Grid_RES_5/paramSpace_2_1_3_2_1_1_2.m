function [aeroForces] = paramSpace_2_1_3_2_1_1_2(sailStates,airStates)

	CL = (3.977118)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.730978)*sailStates.p + (39.070938)*sailStates.q + (-1.577561)*sailStates.r + (0.011152)*sailStates.de;
	CD = -0.068670;
	CY = (-0.071359)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.440779)*sailStates.p + (-0.230432)*sailStates.q + (-0.093699)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (1.262422)*sailStates.alpha + (0.229520)*sailStates.beta + (-1.347583)*sailStates.p + (12.081532)*sailStates.q + (-1.203117)*sailStates.r + (0.000633)*sailStates.de;
	Cm = (-12.742099)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.520737)*sailStates.p + (-140.986252)*sailStates.q + (5.248497)*sailStates.r + (-0.068102)*sailStates.de;
	Cn = (0.271783)*sailStates.alpha + (0.048786)*sailStates.beta + (0.772044)*sailStates.p + (-2.385805)*sailStates.q + (-0.030758)*sailStates.r + (-0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end