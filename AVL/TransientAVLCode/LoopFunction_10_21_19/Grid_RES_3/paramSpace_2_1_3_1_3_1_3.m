function [aeroForces] = paramSpace_2_1_3_1_3_1_3(sailStates,airStates)

	CL = (7.059639)*sailStates.alpha + (-0.488941)*sailStates.beta + (-3.451512)*sailStates.p + (41.881779)*sailStates.q + (-2.649173)*sailStates.r + (0.011424)*sailStates.de;
	CD = -2.859490;
	CY = (-0.267445)*sailStates.alpha + (-0.024405)*sailStates.beta + (-1.306960)*sailStates.p + (1.697130)*sailStates.q + (0.000159)*sailStates.r + (0.000370)*sailStates.de;

	Cl = (2.947841)*sailStates.alpha + (0.428519)*sailStates.beta + (-1.975992)*sailStates.p + (16.955708)*sailStates.q + (-2.407697)*sailStates.r + (0.001643)*sailStates.de;
	Cm = (-15.070691)*sailStates.alpha + (1.833989)*sailStates.beta + (11.758264)*sailStates.p + (-161.037445)*sailStates.q + (8.958389)*sailStates.r + (-0.072227)*sailStates.de;
	Cn = (1.321439)*sailStates.alpha + (-0.000872)*sailStates.beta + (2.891770)*sailStates.p + (-14.524115)*sailStates.q + (-0.000376)*sailStates.r + (-0.000795)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end