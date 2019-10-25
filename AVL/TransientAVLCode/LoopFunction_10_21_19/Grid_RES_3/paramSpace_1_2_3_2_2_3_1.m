function [aeroForces] = paramSpace_1_2_3_2_2_3_1(sailStates,airStates)

	CL = (4.236570)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.043552)*sailStates.p + (28.686039)*sailStates.q + (0.288635)*sailStates.r + (0.010035)*sailStates.de;
	CD = -0.369850;
	CY = (-0.088687)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.334375)*sailStates.p + (-0.267956)*sailStates.q + (0.058934)*sailStates.r + (-0.000057)*sailStates.de;

	Cl = (1.053242)*sailStates.alpha + (-0.156496)*sailStates.beta + (-0.832749)*sailStates.p + (5.979325)*sailStates.q + (0.487870)*sailStates.r + (-0.000178)*sailStates.de;
	Cm = (-15.366619)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.649703)*sailStates.p + (-124.628265)*sailStates.q + (-0.934873)*sailStates.r + (-0.067322)*sailStates.de;
	Cn = (0.527055)*sailStates.alpha + (-0.027595)*sailStates.beta + (-0.854889)*sailStates.p + (4.277608)*sailStates.q + (-0.039053)*sailStates.r + (0.000134)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end