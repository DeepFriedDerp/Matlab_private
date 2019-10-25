function [aeroForces] = paramSpace_1_3_3_2_3_1_3(sailStates,airStates)

	CL = (4.765365)*sailStates.alpha + (0.388760)*sailStates.beta + (-2.926643)*sailStates.p + (41.556171)*sailStates.q + (-2.216312)*sailStates.r + (0.011541)*sailStates.de;
	CD = -0.635040;
	CY = (0.002816)*sailStates.alpha + (-0.022497)*sailStates.beta + (-0.812061)*sailStates.p + (1.027330)*sailStates.q + (-0.143091)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.716905)*sailStates.alpha + (0.492360)*sailStates.beta + (-1.454725)*sailStates.p + (13.229481)*sailStates.q + (-1.782639)*sailStates.r + (0.000688)*sailStates.de;
	Cm = (-13.013375)*sailStates.alpha + (-1.374433)*sailStates.beta + (8.718375)*sailStates.p + (-144.553238)*sailStates.q + (7.349570)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.309701)*sailStates.alpha + (0.060372)*sailStates.beta + (1.604031)*sailStates.p + (-7.277567)*sailStates.q + (0.013396)*sailStates.r + (-0.000454)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end