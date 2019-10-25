function [aeroForces] = paramSpace_1_4_4_1_3_3_2(sailStates,airStates)

	CL = (5.107659)*sailStates.alpha + (-0.289290)*sailStates.beta + (-2.243154)*sailStates.p + (27.283381)*sailStates.q + (0.859313)*sailStates.r + (0.009038)*sailStates.de;
	CD = -1.585360;
	CY = (0.182337)*sailStates.alpha + (-0.020007)*sailStates.beta + (0.568984)*sailStates.p + (1.664521)*sailStates.q + (0.113357)*sailStates.r + (0.000349)*sailStates.de;

	Cl = (0.993078)*sailStates.alpha + (-0.405984)*sailStates.beta + (-1.023219)*sailStates.p + (7.226645)*sailStates.q + (1.110856)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-15.683289)*sailStates.alpha + (1.264489)*sailStates.beta + (9.026097)*sailStates.p + (-131.445847)*sailStates.q + (-2.809582)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (0.341461)*sailStates.alpha + (-0.063209)*sailStates.beta + (-1.506922)*sailStates.p + (5.964022)*sailStates.q + (-0.038956)*sailStates.r + (-0.000354)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end