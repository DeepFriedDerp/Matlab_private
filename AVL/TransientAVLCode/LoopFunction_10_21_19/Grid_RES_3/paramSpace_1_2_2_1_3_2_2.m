function [aeroForces] = paramSpace_1_2_2_1_3_2_2(sailStates,airStates)

	CL = (4.222638)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.458635)*sailStates.p + (35.487385)*sailStates.q + (-1.310490)*sailStates.r + (0.010742)*sailStates.de;
	CD = -0.038790;
	CY = (0.220705)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.464994)*sailStates.p + (1.671348)*sailStates.q + (-0.081991)*sailStates.r + (0.000355)*sailStates.de;

	Cl = (1.470900)*sailStates.alpha + (0.165828)*sailStates.beta + (-1.147244)*sailStates.p + (9.965601)*sailStates.q + (-0.956962)*sailStates.r + (0.000236)*sailStates.de;
	Cm = (-14.206753)*sailStates.alpha + (0.000000)*sailStates.beta + (7.806943)*sailStates.p + (-133.415192)*sailStates.q + (4.364367)*sailStates.r + (-0.068163)*sailStates.de;
	Cn = (-0.187210)*sailStates.alpha + (0.029240)*sailStates.beta + (0.832845)*sailStates.p + (-4.399967)*sailStates.q + (0.013784)*sailStates.r + (-0.000539)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end