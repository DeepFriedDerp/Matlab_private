function [aeroForces] = paramSpace_14_1_2_2_2_1_2(sailStates,airStates)

	CL = (3.890479)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.643657)*sailStates.p + (34.985874)*sailStates.q + (0.487099)*sailStates.r + (0.010341)*sailStates.de;
	CD = -0.029790;
	CY = (0.022668)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.056599)*sailStates.p + (0.230434)*sailStates.q + (0.012022)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.278088)*sailStates.alpha + (0.019169)*sailStates.beta + (-1.319965)*sailStates.p + (11.002989)*sailStates.q + (0.193146)*sailStates.r + (0.000633)*sailStates.de;
	Cm = (-14.400663)*sailStates.alpha + (0.000000)*sailStates.beta + (9.279105)*sailStates.p + (-140.986252)*sailStates.q + (-1.680658)*sailStates.r + (-0.068102)*sailStates.de;
	Cn = (-0.260478)*sailStates.alpha + (-0.004075)*sailStates.beta + (0.361988)*sailStates.p + (-2.688339)*sailStates.q + (-0.058393)*sailStates.r + (-0.000087)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end