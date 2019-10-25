function [aeroForces] = paramSpace_2_3_3_1_1_2_2(sailStates,airStates)

	CL = (4.142828)*sailStates.alpha + (-0.000834)*sailStates.beta + (-2.583829)*sailStates.p + (34.867199)*sailStates.q + (0.113221)*sailStates.r + (0.011059)*sailStates.de;
	CD = -0.014180;
	CY = (-0.208631)*sailStates.alpha + (-0.025520)*sailStates.beta + (0.205675)*sailStates.p + (-1.693497)*sailStates.q + (0.013421)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.300810)*sailStates.alpha + (-0.036977)*sailStates.beta + (-1.202383)*sailStates.p + (9.554705)*sailStates.q + (0.145711)*sailStates.r + (0.000339)*sailStates.de;
	Cm = (-15.000282)*sailStates.alpha + (0.008438)*sailStates.beta + (8.952705)*sailStates.p + (-137.990799)*sailStates.q + (-0.371785)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (0.321437)*sailStates.alpha + (-0.001415)*sailStates.beta + (-0.470453)*sailStates.p + (3.562922)*sailStates.q + (-0.016064)*sailStates.r + (0.000517)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end