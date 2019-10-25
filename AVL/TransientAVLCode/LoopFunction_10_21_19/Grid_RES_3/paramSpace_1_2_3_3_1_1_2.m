function [aeroForces] = paramSpace_1_2_3_3_1_1_2(sailStates,airStates)

	CL = (4.138371)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.561179)*sailStates.p + (37.185539)*sailStates.q + (-1.401766)*sailStates.r + (0.011271)*sailStates.de;
	CD = -0.131580;
	CY = (-0.064536)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.404691)*sailStates.p + (-0.491627)*sailStates.q + (-0.071405)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.212660)*sailStates.alpha + (0.221960)*sailStates.beta + (-1.197288)*sailStates.p + (10.410019)*sailStates.q + (-1.081894)*sailStates.r + (0.000365)*sailStates.de;
	Cm = (-13.304479)*sailStates.alpha + (0.000000)*sailStates.beta + (8.092972)*sailStates.p + (-136.151047)*sailStates.q + (4.669782)*sailStates.r + (-0.068436)*sailStates.de;
	Cn = (0.084729)*sailStates.alpha + (0.039138)*sailStates.beta + (0.770370)*sailStates.p + (-2.583333)*sailStates.q + (-0.017841)*sailStates.r + (0.000058)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end