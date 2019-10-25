function [aeroForces] = paramSpace_4_2_1_2_1_2_3(sailStates,airStates)

	CL = (3.974567)*sailStates.alpha + (0.074351)*sailStates.beta + (-2.846516)*sailStates.p + (38.635929)*sailStates.q + (1.322191)*sailStates.r + (0.010961)*sailStates.de;
	CD = 0.031040;
	CY = (-0.074873)*sailStates.alpha + (-0.025991)*sailStates.beta + (0.367882)*sailStates.p + (-1.057313)*sailStates.q + (-0.073063)*sailStates.r + (-0.000226)*sailStates.de;

	Cl = (1.447291)*sailStates.alpha + (-0.111746)*sailStates.beta + (-1.483590)*sailStates.p + (13.204173)*sailStates.q + (0.931211)*sailStates.r + (0.000840)*sailStates.de;
	Cm = (-13.859164)*sailStates.alpha + (-0.234319)*sailStates.beta + (9.179332)*sailStates.p + (-144.624481)*sailStates.q + (-4.379018)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (-0.216348)*sailStates.alpha + (0.027949)*sailStates.beta + (-0.562577)*sailStates.p + (2.424322)*sailStates.q + (-0.015096)*sailStates.r + (0.000373)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end